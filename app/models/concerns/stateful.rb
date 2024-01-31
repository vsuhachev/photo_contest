module Stateful
  extend ActiveSupport::Concern

  included do
    validates :state, presence: true

    before_validation :set_initial_state, on: :create

    # after_find :restore_state
    # after_initialize :restore_state
  end

  module ClassMethods
    attr_accessor :state_machine
  end

  def state_machine_class
    self.class.state_machine or fail "state machine not defined"
  end

  def set_initial_state
    self.state = state_machine.current
  end

  def restore_state
    state_machine.restore!(state.to_sym) if state.present?
  end

  def state_machine
    @state_machine ||= state_machine_class.tap do |state_machine|
      state_machine.callbacks {
        on_enter do |event|
          target.state = state
        end
      }
    end.new
    @state_machine.target(self)
    @state_machine.restore!(state.to_sym) if state.present?
    @state_machine
  end
end
