module StatefulController
  extend ActiveSupport::Concern

  included do
    helper_method :state_machine, :transition_redirect_url
  end

  def transition
    authorize stateful_model

    @transition = TransitionForm.new(state_machine_params)

    respond_to do |format|
      if @transition.perform
        format.html { redirect_to transition_redirect_url, notice: t('shared.stateful.transition.success') }
        format.json { render :show, status: :ok }
      else
        format.html { render 'shared/stateful/_transition', locals: { i18n_scope: state_machine_i18n_scope } }
        format.json { render json: @transition.errors, status: :unprocessable_entity }
      end
    end
  end

  protected

  def stateful_model
    fail NotImplementedError
  end

  def state_machine
    stateful_model.state_machine
  end

  def state_machine_i18n_scope
    [:state_machine, stateful_model.class.name.underscore]
  end

  def transition_redirect_url
    { controller: controller_name, action: 'show', id: stateful_model }
  end

  def state_machine_params
    params.require(:state_machine).permit(:event, :payload).merge(stateful_model: stateful_model)
  end

  class TransitionForm
    include ActiveModel::Model

    attr_accessor :event, :stateful_model

    validates :event, presence: true
    validate do
      if state_machine.event_names.map(&:to_s).include?(event)
        errors.add(:event, :not_available) if state_machine.cannot?(event.to_sym)
      else
        errors.add(:event, :invalid)
      end
    end

    def perform
      return false unless valid?

      ActiveRecord::Base.transaction do
        state_machine.trigger(event.to_sym)
        stateful_model.save
      end

      true
    end

    def state_machine
      stateful_model.state_machine
    end
  end
end