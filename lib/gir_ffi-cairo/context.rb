module Cairo
  load_class :Context

  class Context
    def self.create target
      ptr = Lib.cairo_create target
      self.wrap ptr
    end

    def get_target
      ptr = Lib.cairo_get_target self
      Surface.wrap ptr
    end

    def save
      Lib.cairo_save self
    end

    def restore
      Lib.cairo_restore self
    end

    def push_group
      Lib.cairo_push_group self
    end

    def push_group_with_content ctx
      Lib.cairo_push_group_with_content self, ctx
    end

    def pop_group
      Lib.cairo_pop_group self
    end

    def pop_group_to_source
      Lib.cairo_pop_group_to_source self
    end

    def set_operator oper
      Lib.cairo_set_operator self, oper
    end

    def set_source_rgb r, g, b
      Lib.cairo_set_source_rgb self, r, g, b
    end

    def set_source_rgba r, g, b, a
      Lib.cairo_set_source_rgba self, r, g, b, a
    end

    def translate x, y
      Lib.cairo_translate self, x, y
    end

    def scale x, y
      Lib.cairo_scale self, x, y
    end

    def rotate angle
      Lib.cairo_rotate self, angle
    end

    # painting
    def paint
      Lib.cairo_paint self
    end

    def paint_with_alpha alpha
      Lib.cairo_paint_with_alpha self, alpha
    end

    def stroke
      Lib.cairo_stroke self
    end

    def stroke_preserve
      Lib.cairo_stroke_preserve self
    end

    def fill
      Lib.cairo_fill self
    end

    def fill_preserve
      Lib.cairo_fill_preserve self
    end
  end

  module Lib
    attach_function :cairo_create, [:pointer], :pointer
    attach_function :cairo_get_target, [:pointer], :pointer

    attach_function :cairo_save, [:pointer], :void
    attach_function :cairo_restore, [:pointer], :void
    attach_function :cairo_push_group, [:pointer], :void
    attach_function :cairo_push_group_with_content, [:pointer, :pointer], :void
    attach_function :cairo_pop_group, [:pointer], :void
    attach_function :cairo_pop_group_to_source, [:pointer], :void

    attach_function :cairo_set_operator, [:pointer, :Operator], :void
    #set_source
    attach_function :cairo_set_source_rgb,
      [:pointer, :double, :double, :double], :void
    attach_function :cairo_set_source_rgba,
      [:pointer, :double, :double, :double, :double], :void

    attach_function :cairo_translate, [:pointer, :double, :double], :void
    attach_function :cairo_scale, [:pointer, :double, :double], :void
    attach_function :cairo_rotate, [:pointer, :double], :void

    # painting
    attach_function :cairo_paint, [:pointer], :void
    attach_function :cairo_paint_with_alpha, [:pointer, :double], :void
    attach_function :cairo_stroke, [:pointer], :void
    attach_function :cairo_stroke_preserve, [:pointer], :void
    attach_function :cairo_fill, [:pointer], :void
    attach_function :cairo_fill_preserve, [:pointer], :void
  end
end
