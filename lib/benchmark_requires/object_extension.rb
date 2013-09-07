class Object

  def load file_name, wrap=false
    result = nil
    BenchmarkRequires.benchmark(file_name) do 
      result = super(file_name, wrap)
    end

    return result 
  end 

  def require file_name
    result = nil
    BenchmarkRequires.benchmark(file_name) do
      result = super(file_name)
    end
    return result 
  end

end
