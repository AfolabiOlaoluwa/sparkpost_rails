require 'spec_helper'

describe SparkPostRails::DeliveryMethod do

  before(:each) do
    @delivery_method = SparkPostRails::DeliveryMethod.new
  end

  context "Substitution Data" do
    it "handles skip_suppression value from message" do
      test_email = Mailer.test_email sparkpost_data: {skip_suppression: true}

      @delivery_method.deliver!(test_email)

      expect(@delivery_method.data[:options][:skip_suppression]).to eq(true)
    end

    it "does not include substitution data element if none is passed" do
      test_email = Mailer.test_email
      @delivery_method.deliver!(test_email)

      expect(@delivery_method.data[:options].has_key?(:skip_suppression)).to eq(false)
    end

  end
end

