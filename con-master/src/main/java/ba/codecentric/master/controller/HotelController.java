package ba.codecentric.master.controller;

import ba.codecentric.base.domain.Hotel;
import ba.codecentric.base.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
public class HotelController {

    private final HotelService hotelService;

    @Autowired
    public HotelController(HotelService hotelService) {
        this.hotelService = hotelService;
    }

    @RequestMapping(value = "/hotel", method = RequestMethod.POST)
    public Hotel saveHotel(@Valid @RequestBody Hotel hotel) throws Exception{
        return hotelService.saveHotel(hotel);

    }

    @RequestMapping(value = "/hotel", method = RequestMethod.GET)
    public Hotel getHotel() {
        Hotel hotel = hotelService.getHotel();
        return (hotel == null) ? new Hotel() : hotel;

    }
}
