require 'spec_helper'

describe User do
  it 'shoud have many followers and followees' do
    bob = User.create!
    sam = User.create!
    laura = User.create!
    susan = User.create!

    sam.followers   << bob
    laura.followers << bob
    susan.followers << bob

    expect(sam.followers).to include bob
    expect(laura.followers).to include bob
    expect(susan.followers).to include bob

    expect(bob.followees).to include sam
    expect(bob.followees).to include laura
    expect(bob.followees).to include susan
  end
end
