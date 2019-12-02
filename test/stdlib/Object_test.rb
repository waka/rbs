class ObjectTest < StdlibTest
  target Object
  using hook.refinement

  def test_operators
    Object.new !~ 123

    Object.new <=> 123
    Object.new <=> Object.new

    Object.new === false
  end

  def test_class
    Object.new.class
  end

  def test_clone
    Object.new.clone
    Object.new.clone(freeze: false)
  end

  def test_define_singleton_method
    Object.new.define_singleton_method(:foo) {|x, y, z| x+y+z }
    Object.new.define_singleton_method(:foo, Object.instance_method(:class))
  end

  def test_display
    Object.new.display()
    Object.new.display(STDOUT)
    Object.new.display(StringIO.new)
  end

  def test_dup
    Object.new.dup
  end

  def test_enum_for
    Object.new.enum_for()
    Object.new.enum_for(:each, 1,2,3)
    Object.new.enum_for(:foo, 1,2,3) { |x,y,z| x + y + z }
  end

  def test_eql
    Object.new.eql?(1)
  end

  def test_extend
    Object.new.extend(Math, Comparable, Enumerable)
  end

  def test_freeze
    Object.new.freeze
  end

  def test_frozen
    Object.new.frozen?
  end

  def test_hash
    Object.new.hash
  end

  def test_inspect
    Object.new.inspect
  end

  def test_itself
    "itself".itself
  end

  def test_respond_to?
    Object.new.respond_to?(:to_s)
    Object.new.respond_to?('to_s')
    Object.new.respond_to?('to_s', true)
  end
end
