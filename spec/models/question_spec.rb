require 'rails_helper'

describe Question do
  it { should validate_presence_of :content }
  it { should have_many :answers }
  it { should belong_to :user }
end
