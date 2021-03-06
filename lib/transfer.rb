class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
      # binding.pry
      if sender.valid? && self.status == "pending" && sender.balance - self.amount > 0

        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
      # binding.pry
    end

    def reverse_transfer
      if self.status == "complete"
        sender.balance += self.amount
        receiver.balance -= self.amount
        self.status = "reversed"
      end
    end
    
end
