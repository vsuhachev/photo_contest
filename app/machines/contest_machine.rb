class ContestMachine < FiniteMachine::Definition
  initial :draft

  events {
    event :start, :draft => :preparation
    event :launch, :preparation => :in_progress
    event :finish, :in_progress => :finished
    event :archive, :finished => :archived
  }
end
