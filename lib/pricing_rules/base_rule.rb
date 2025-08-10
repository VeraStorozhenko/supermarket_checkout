class BaseRule
  def apply(items)
    raise NotImplementedError, "Override in subclass"
  end
end
