require 'spec_helper'

describe Caption do
    it { should belong_to(:user) }
    it { should allow_mass_assignment_of(:body) }
end