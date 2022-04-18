class Strategy
  # @abstract
  #
  # @param int id
  def get_patient_by_id(_id)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end