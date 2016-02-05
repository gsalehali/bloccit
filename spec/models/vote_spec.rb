require 'rails_helper'

descirbe Vote do
  descirbe "validations" do
    descirbe "value validation" do
      it "only allows -1 or 1 as values" do
        value = 2
        expect(value.valid?).to eq(false)
      end
    end
  end
end