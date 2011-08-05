# contains 0% jquery calls, could concievably even be used serverside
class self.AntiGallery
  constructor: (@images) ->
    @currentIndex = 0
    @currentThumbIndex = 0

  stripThumb: (image) ->
    image.thumb

  stripFull: (image) ->
    image.full

  firstImage: ->
    @stripFull @images[0]

  registerNext: (button) ->
    button.click (evt) =>
      evt.preventDefault()
      @nextImage()

  registerPrevious: (button) ->
    button.click (evt) =>
      evt.preventDefault()
      @previousImage()

  registerThumbClick: (button) ->
    button.click (evt) =>
      evt.preventDefault()
      index = $(evt.target).data(@renderer.thumbIndexName())
      @setImageAndIndex(index)

  setImageAndIndex: (index) ->
    @currentIndex = index
    @renderer.renderMainImage @imageForIndex(index)

  imageForIndex: (index) ->
    @stripFull @images[index]

  nextImage: ->

  previousImage: ->

  clickThumb: ->

  thumbs: ->
    @stripThumb image for image in @images

  renderWith: (@renderer) ->
    @renderer.renderMainImage @firstImage()
    @renderer.renderThumbs @thumbs()
    @registerPrevious @renderer.previousButton()
    @registerNext @renderer.nextButton()
    @registerThumbClick @renderer.thumbElement()


