class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind
  has_many :phones 
  has_one :address

  #to aditional information use meta
  meta do
    {author: "author name"}
  end

  #to add link information
  link(:self) {contact_path(object.id)}
  link(:kind) {kind_path(object.kind.id)}
  

  def attributes(*args)
    h = super(*args)
    #pt-BR
    #h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h 
  end

end
