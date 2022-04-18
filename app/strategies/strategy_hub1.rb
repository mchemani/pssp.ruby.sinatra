class HubApiClient < Strategy
  def get_patient_by_id(id)
    'Hub 1: Getting the patient!' + id.to_s
  end
end