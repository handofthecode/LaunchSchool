class Garden
CHILDREN = %w(alice bob charlie david eve fred ginny 
              harriet ileana joseph kincaid larry).freeze
PLANTS = { "G" => :grass, "C" => :clover, 
           "R" => :radishes, "V" => :violets }.freeze

  def initialize(garden, students = CHILDREN)
    @garden = garden.split("\n").map(&:chars)
    @students = create_student_hash(students)
    create_student_methods
  end

  def create_student_hash(students)   #EXAMPLE: { alice: [0, 1], bob: [2, 3] }
    plant_column = 0
    students.sort.each_with_object({}) do |(student), hash| 
      hash[student.downcase.to_sym] = [plant_column, plant_column + 1]
      plant_column += 2
    end
  end
  
  def create_student_methods
     @students.keys.each do |name| 
      define_singleton_method(name) do 
        plant_keys = @garden[0][@students[name][0]] +      # FRONT ROW
                     @garden[0][@students[name][1]] +
                     @garden[1][@students[name][0]] +      # BACK ROW
                     @garden[1][@students[name][1]]
        plant_keys.chars.map { |key| PLANTS[key] }
      end
    end
  end
end
