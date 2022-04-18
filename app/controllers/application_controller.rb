require './config/environment'

class ApplicationController < Sinatra::Base
  get "/" do
    patient_id = rand(1..10)

    ## Based on the patient we'll choose the right API to call 
    ## using the strategy pattern
    if (patient_id % 2).zero?
      context = PsspContext.new(HubApiClient.new)
    else
      context = PsspContext.new(Hub2ApiClient.new)
    end

    context.get_patient_by_id(patient_id)
  end
end

class PsspContext
  attr_writer :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def strategy=(strategy)
    @strategy = strategy
  end

  def get_patient_by_id(id)
     @strategy.get_patient_by_id(id)
  end
end

class Strategy
  # @abstract
  #
  # @param int id
  def get_patient_by_id(_id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class HubApiClient < Strategy
  def get_patient_by_id(id)
    'Hub 1: Getting the patient!' + id.to_s
  end
end


class Hub2ApiClient < Strategy
  def get_patient_by_id(id)
    'Hub 2: Getting the patient!' + id.to_s
  end
end
