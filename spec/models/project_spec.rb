require 'active_record_spec_helper'
require 'carrier_wave_spec_helper'
require 'models/project'

describe Project do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:image) }
end
