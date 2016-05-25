module ReportsHelper
    def data_for_select(param)
      Lookup.where(lookup_type: param) #.collect { |m| [m.value, m.id] }
    end

    def generate_rport(name, hospi)
      puts "On generate_report"
      generate(name, hospi)
    end

    def display_parameters_for(param)
      if param.include?("Hospital")
        select_tag 'hospi', options_from_collection_for_select(@hospitales, "id", "value")
      elsif param.include?("Fallecido")
        text_field 'fecha_ini', 'data-behaviour' => 'datepicker'
        text_field 'fecha_fin', 'data-behaviour' => 'datepicker'
      end
    end
end
