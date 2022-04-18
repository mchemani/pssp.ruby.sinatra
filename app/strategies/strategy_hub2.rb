class Hub2ApiClient < Strategy
  def get_patient_by_id(id)
    'Hub 2: Getting the patient!' + id.to_s
  end
end