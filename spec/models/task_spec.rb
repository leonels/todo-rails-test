require 'spec_helper'

describe Task do
  context "(empty)" do
    subject { Task.new }
    it "should not be valid" do
      expect(subject.valid?).to be_false
    end

    it "due_at attribute should be accessible" do
      Task.accessible_attributes.include?(:due_at)
    end
  end
end
