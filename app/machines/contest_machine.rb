class ContestMachine < FiniteMachine::Definition
  initial :draft

  events {
    event :start, draft: :preparation, unless: ->(target) { target.nominations.empty? || target.criteria.empty? }
    event :un_start, preparation: :draft

    event :launch, preparation: :in_progress, unless: ->(target) { target.jurors.empty? || target.photos.empty? }
    event :un_launch, in_progress: :preparation

    event :finish, in_progress: :finished
    event :un_finish, finished: :in_progress

    event :archive, finished: :archived
    event :un_archive, archived: :finished
  }
end
