unless String.new.respond_to?(:blank?)
  class String
    def blank?
      !!empty?
    end
  end
end

unless String.new.respond_to?(:present?)
  class String
    def present?
      !blank?
    end
  end
end