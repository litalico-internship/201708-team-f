class SchedulesController < ApplicationController
  def new
  end

  def create
    file_name = "#{SecureRandom.hex(10)}.csv"
    file_path = Rails.root.join('tmp', file_name)
    file = File.open(file_path, 'w')
    file.write(map_params_to_csv(params))
    file.close
    output = `python #{Rails.root.join('lib', 'python', 'schedule.py')} #{file_path}}`
    render plain: output
  end

  def map_params_to_csv(params)
    csv_values = []
    csv_values << parse_time(params, 'need_time')
    csv_values << parse_time(params, 'work_start_at')
    csv_values << parse_time(params, 'work_finish_at')
    csv_values << parse_time(params, 'oneway_commute_time')
    csv_values << params[:must_task]
    csv_values.join(',')
  end

  def parse_time(params, key_name)
    hours = params["#{key_name}(4i)"]
    minutes = params["#{key_name}(5i)"]
    "#{format('%02d', hours)}:#{format('%02d', minutes)}"
  end
end
