require 'test_helper'

class OpportunityTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Opportunity.new.valid?
  end
end
