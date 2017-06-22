class OrderProductSerializer < ProductSerializer
   def include_user?
    false
  end

  def cache_key
    [object, scope]
  end
end
