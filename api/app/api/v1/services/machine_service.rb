module Services
  class MachineService
    def build_response(machines, muscle_id)
      machines.map do |machine|
        {
          id: machine.id,
          name: machine.name,
          video_urls: machine.video_urls_by_muscle_id(muscle_id)
        }
      end
    end
  end
end