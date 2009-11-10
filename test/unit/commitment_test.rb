require 'test_helper'

class CommitmentTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Commitment.new.valid?
  end
end
