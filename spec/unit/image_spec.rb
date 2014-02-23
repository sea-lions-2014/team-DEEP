require 'spec_helper'

describe Image do

 it { should allow_mass_assignment_of(:url) }
 it { should allow_mass_assignment_of(:title) }
 it { should allow_mass_assignment_of(:user_id) }
 it { should belong_to(:user) }
 it { should have_many(:captions) }

end