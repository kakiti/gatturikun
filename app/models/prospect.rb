class Prospect < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '◎(成約)' },
    { id: 3, name: '○(見込みあり)' },
    { id: 4, name: '△(微妙)' },
    { id: 5, name: '×(不成約)' }
  ]

  include ActiveHash::Associations
  has_many :clients
end
