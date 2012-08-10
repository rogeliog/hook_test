require 'spec_helper'

describe Commit do
  let(:json) {JSON.parse "{\"message\":\"Message\",\"url\":\"some.com\",\"timestamp\":\"2012-08-10 14:34:56 -0500\",\"author\":{\"name\":\"Name\"}}"}
  let(:commit) { Commit.new}
  describe '.updated_attributes_from_hook' do
    it 'Sets the author' do
      commit.updated_attributes_from_hook(json)
      commit.author.should == json['author']['name']
    end
    it 'Sets the message' do
      commit.updated_attributes_from_hook(json)
      commit.message.should == json['message']
    end
    it 'Sets the time' do
      commit.updated_attributes_from_hook(json)
      commit.time.should == Time.parse(json['timestamp'])
    end
    it 'Sets the url' do
      commit.updated_attributes_from_hook(json)
      commit.url.should == json['url']
    end
  end

  describe '#not_notified' do
    it 'Returns the not notified commits' do
      commit = Commit.create notified: false
      Commit.not_notified.should == [commit]
    end
    it 'Does not return the notified commits' do
      commit = Commit.create notified: true
      Commit.not_notified.should == []
    end
  end
end
