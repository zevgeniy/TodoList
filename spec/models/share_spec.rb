require "spec_helper"

describe Share do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
end
