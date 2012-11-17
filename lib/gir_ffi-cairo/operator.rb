module Cairo
  module Lib
    enum :Operator, [
      :clear,

      :source,
      :over,
      :in,
      :out,
      :atop,

      :dest,
      :dest_over,
      :dest_in,
      :dest_out,
      :dest_atop,

      :xor,
      :add,
      :saturate,

      :multiply,
      :screen,
      :overlay,
      :darken,
      :lighten,
      :color_dodge,
      :color_burn,
      :hard_light,
      :soft_light,
      :difference,
      :exclusion,
      :hsl_hue,
      :hsl_saturation,
      :hsl_color,
      :hsl_luminosity,
    ]
  end

  Operator = Lib.enum_type :Operator
end
