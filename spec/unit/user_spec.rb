require 'spec_helper'
# require 'bcrypt'

describe User do
  # include BCrypt
  it { should have_many(:captions) }
  it { should have_many(:images) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:password) }
  it { should validate_presence_of(:name) }
end