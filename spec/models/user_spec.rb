require 'spec_helper'

describe User do

	it { should ensure_length_of(:password).is_at_least(8) }
	it { should have_many(:posts) }
	it { should have_many(:comments) }

end