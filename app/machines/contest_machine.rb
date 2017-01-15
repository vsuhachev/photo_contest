class ContestMachine < FiniteMachine::Definition
  initial :draft

  events {
    event :start, :draft => :preparation
    event :un_start, :preparation => :draft

    event :launch, :preparation => :in_progress
    event :un_launch, :in_progress => :preparation

    event :finish, :in_progress => :finished
    event :archive, :finished => :archived
  }
end
