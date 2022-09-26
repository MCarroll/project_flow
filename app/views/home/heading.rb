module Views
  class Heading < Phlex::Component
    def template
      h1 "My Phex Header"
      p "Render ruby generated view components"
    end
  end
end
