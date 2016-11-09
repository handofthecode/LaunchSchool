class CircularBuffer
  class BufferFullException < RuntimeError; end
  class BufferEmptyException < RuntimeError; end
  def initialize(num)
    @buffer = Array.new(num)
  end

  def write(value)
    buffer_full? ? (raise BufferFullException) : write!(value)
  end

  def write!(value)
    return if value.nil?
    if buffer_full?
      @buffer.shift
      @buffer.push(value)
    else
      @buffer[write_idx] = value
    end
  end

  def write_idx
    @buffer.index(nil)
  end

  def read
    result = @buffer.shift
    @buffer << nil
    result.nil? ? (raise BufferEmptyException) : result
  end

  def buffer_full?
    !@buffer.include?(nil)
  end

  def clear
    @buffer = @buffer.map { nil }
  end
end
