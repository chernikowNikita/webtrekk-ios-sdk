internal final class DefaultMediaTracker: MediaTracker {

	private let handler: MediaEventHandler

	internal var advertisementProperties = AdvertisementProperties(id: nil)
	internal var customProperties = [String : String]()
	internal var ecommerceProperties = EcommerceProperties()
	internal var mediaProperties: MediaProperties
	internal var pageProperties = PageProperties(name: nil)


	internal init(handler: MediaEventHandler, mediaName: String) {
		checkIsOnMainThread()

		self.handler = handler
		self.mediaProperties = MediaProperties(name: mediaName)
	}


	internal func trackEvent(kind: MediaEvent.Kind) {
		checkIsOnMainThread()

		handler.handleEvent(MediaEvent(
			kind:                     kind,
			mediaProperties:          mediaProperties,
			pageProperties:           pageProperties,
			customProperties:         customProperties,
			advertisementProperties:  advertisementProperties,
			ecommerceProperties:      ecommerceProperties
		))
	}
}