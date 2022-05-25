class TypeCollection
  attr_reader :list

  def initialize
    @list = []
  end

  def get
    type = @list[0].class.name
    message = "Select [1] for a #{type} from the list or select [2] to create a new #{type}: "
  end

  def display
    puts @list
  end
end
