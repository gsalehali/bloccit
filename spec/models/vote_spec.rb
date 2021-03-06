require 'rails_helper'

describe Vote do

  include TestFactories

  describe "validations" do
    describe "value validation" do       
      it "only allows -1 or 1 as values" do
          value = Vote.new(value: 2)         
          expect(value.valid?).to eq(false)
      end
    end
  end

  describe 'after_save' do
    it "calls 'post#update_rand' after save" do
      post = associated_post
      vote = Vote.new(value: 1, post: post)
      expect(post).to receive(:update_rank)
      vote.save
    end
  end
end