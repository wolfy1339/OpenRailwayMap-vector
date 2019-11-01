/*
OpenRailwayMap Style File for JOSM and KothicJS
Signalling layer

OpenRailwayMap Copyright (C) 2012 Alexander Matheisen
This program comes with ABSOLUTELY NO WARRANTY.
This is free software, and you are welcome to redistribute it under certain conditions.
See https://wiki.openstreetmap.org/wiki/OpenRailwayMap for details.

Format details:
* https://josm.openstreetmap.de/wiki/Help/Styles/MapCSSImplementation
* https://wiki.openstreetmap.org/wiki/MapCSS/0.2
*/

@signal-text-fill: @signal-text-fill;
@signal-text-halo-fill: @signal-text-halo-fill;
@signal-text-halo-radius: 1;
@signal-text-halo-radius-large: 3;

#railway_signals {

  /*********************************/
  /* DE crossing distant sign Bü 2 */
  /*********************************/
  [zoom>=15]["feature"="DE-ESO:bü2"] {
    marker-file: url('icons/de/bue2-ds.svg');
    marker-width: 7;
    marker-height: 28;
    marker-allow-overlap: true;

    /* reduced distance */
    ["feature"="DE-ESO:bü2"]["crossing_distant_shortened"="yes"] {
      marker-file: url('icons/de/bue2-ds-reduced-distance.svg');
    }
  }

  /*********************************/
  /* DE whistle sign Bü 4 (DS 301) */
  /*********************************/
  [zoom>=14]["feature"="DE-ESO:db:bü4"] {
    marker-file: url('icons/de/bue4-ds.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* for trains not stopping at a halt */
    ["ring_only_transit"="yes"] {
      marker-file: url('icons/de/bue4-ds-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*********************************/
  /* DE whistle sign Pf 1 (DV 301) */
  /*********************************/
  [zoom>=14]["feature"="DE-ESO:dr:pf1"] {
    marker-file: url('icons/de/pf1-dv.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* DE whistle sign Pf 1 (DV 301) for trains not stopping at a halt */
    ["ring_only_transit"="yes"] {
      marker-file: url('icons/de/pf1-dv-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*********************/
  /* DE ring sign Bü 5 */
  /*********************/
  [zoom>=15]["feature"="DE-ESO:bü5"] {
    marker-file: url('icons/de/bue5.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    /* DE ring sign Bü 5 for trains not stopping at a halt */
    ["ring_only_transit"="yes"] {
      marker-file: url('icons/de/bue5-only-transit.svg');
      marker-width: 12;
      marker-height: 21;
    }
  }

  /*****************************/
  /* DE crossing signal Bü 0/1 */
  /*****************************/
  [zoom>=15]["feature"="DE-ESO:bü"] {
    marker-file: url('icons/de/bue1-ds.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;

    /* repeaters */
    ["crossing_repeated"="yes"] {
      marker-file: url('icons/de/bue1-ds-repeated.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* shortened breaking distance */
    ["crossing_shortened"="yes"] {
      marker-file: url('icons/de/bue1-ds-shortened.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* cannot show Bü 1 */
    ["crossing_form"="sign"] {
      marker-file: url('icons/de/bue0-ds.svg');
      marker-width: 7;
      marker-height: 16;

      /* repeaters */
      ["crossing_repeated"="yes"] {
        marker-file: url('icons/de/bue0-ds-repeated.svg');
        marker-width: 9;
        marker-height: 21;
      }

      /* shortened breaking distance */
      ["crossing_shortened"="yes"] {
        marker-file: url('icons/de/bue0-ds-shortened.svg');
        marker-width: 9;
        marker-height: 21;
      }
    }
  }

  /*****************************************************************************/
  /* DE crossing signal Bü 0/1 (ex. So 16a/b) which can show Bü 1 (ex. So 16b) */
  /*****************************************************************************/
  [zoom>=15]["feature"="DE-ESO:so16"]["crossing_form"="light"] {
    marker-file: url('icons/de/bue1-dv.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;

    /* repeaters */
    ["crossing_repeated"="yes"] {
      marker-file: url('icons/de/bue1-dv-repeated.svg');
      marker-width: 9;
      marker-height: 21;
    }

    /* shortened breaking distance */
    ["crossing_shortened"="yes"] {
      marker-file: url('icons/de/bue1-dv-shortened.svg');
      marker-width: 9;
      marker-height: 21;
    }
  }

  /**************************/
  /* FI crossing signal To  */
  /**************************/
  [zoom>=15]["feature"="FI:To"]["crossing_form"="light"] {
    marker-file: url('icons/fi/to1.svg');
    marker-width: 7;
    marker-height: 12;
    marker-allow-overlap: true;
  }

  /***************************************************/
  /* DE tram signal "start of train protection" So 1 */
  /***************************************************/
  [zoom>=15]["feature"="DE-BOStrab:so1"]["train_protection_form"="sign"],["train_protection_type"="start"],
  [zoom>=15]["feature"="DE-AVG:so1"]["train_protection_form"="sign"]["train_protection_type"="start"] {
    marker-file: url('icons/de/bostrab/so1.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;
  }

  /***************************************************/
  /* DE tram signal "end of train protection" So 2 */
  /***************************************************/
  [zoom>=15]["feature"="DE-BOStrab:so2"]["train_protection_form"="sign"]["train_protection_type"="end"],
  [zoom>=15]["feature"="DE-AVG:so2"]["train_protection_form"="sign"]["train_protection_type"="end"] {
    marker-file: url('icons/de/bostrab/so2.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;
  }

  /********************************/
  /* DE station distant sign Ne 6 */
  /********************************/
  [zoom>=14]["feature"="DE-ESO:ne6"]["station_distant_form"="sign"] {
    marker-file: url('icons/de/ne6.svg');
    marker-width: 24;
    marker-height: 5;
    marker-allow-overlap: true;
  }

  /****************************/
  /* DE stop demand post Ne 5 */
  /****************************/
  [zoom>=17]["feature"="DE-ESO:ne5"]["stop_demand_form"="light"],
  [zoom>=17]["feature"="DE-ESO:ne5"]["stop_form"="sign"] {
    marker-file: url('icons/de/ne5-sign.svg');
    marker-width: 11;
    marker-height: 16;
    marker-allow-overlap: true;

    ["stop_form"="light"] {
      marker-file: url('icons/de/ne5-light.svg');
    }

    ::text {
      text-name: [ref];
      text-dy: 14;
      text-fill: @signal-text-fill;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
      text-halo-radius: @signal-text-halo-radius;
      ["stop_form"="sign"] {
        text-halo-radius: @signal-text-halo-radius-large;
      }
    }
  }

  /*********************************************/
  /* DE shunting stop sign Ra 10               */
  /* AT shunting stop sign "Verschubhalttafel" */
  /*********************************************/
  [zoom>=17]["feature"="DE-ESO:ra10"]["shunting_form"="sign"],
  [zoom>=17]["feature"="AT-V2:verschubhalttafel"]["shunting_form"="sign"] {
    marker-file: url('icons/de/ra10.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /********************************/
  /* DE tram minor stop sign Sh 1 */
  /********************************/
  [zoom>=17]["feature"="DE-BOStrab:sh1"]["minor_form"="sign"] {
    marker-file: url('icons/de/bostrab/sh1.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /****************************************/
  /* DE tram passing prohibited sign So 5 */
  /****************************************/
  [zoom>=17]["feature"="DE-BOStrab:so5"]["passing_form"="sign"]["passing_type"="no_passing"] {
    marker-file: url('icons/de/bostrab/so5.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [passing_caption];
      text-fill: @signal-text-fill;
      text-halo-radius: 3;
      text-halo-fill: @signal-text-halo-fill;
      text-dy: 12;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /********************************************/
  /* DE tram passing prohibited end sign So 6 */
  /********************************************/
  [zoom>=17]["feature"="DE-BOStrab:so6"]["passing_form"="sign"]["passing_type"="passing_allowed"] {
    marker-file: url('icons/de/bostrab/so6.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [passing_caption];
      text-fill: @signal-text-fill;
      text-halo-radius: 3;
      text-halo-fill: @signal-text-halo-fill;
      text-dy: 12;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /**************************************************/
  /* DE shunting signal Ra 11 without Sh 1          */
  /* AT Wartesignal ohne "Verschubverbot aufgehoben */
  /**************************************************/
  [zoom>=17]["feature"="DE-ESO:ra11"]["shunting_form"="sign"],
  [zoom>=17]["feature"="AT-V2:wartesignal"]["shunting_form"="sign"] {
    marker-file: url('icons/de/ra11-sign.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**************************************/
  /* DE shunting signal Ra 11 with Sh 1 */
  /**************************************/
  [zoom>=17]["feature"="DE-ESO:ra11"]["shunting_form"="light"] {
    marker-file: url('icons/de/ra11-sh1.svg');
    marker-width: 14;
    marker-height: 15;
    marker-allow-overlap: true;
  }

  /********************************************/
  /* DE shunting signal Ra 11b (without Sh 1) */
  /********************************************/
  [zoom>=17]["feature"="DE-ESO:ra11b"]["shunting_form"="sign"] {
    marker-file: url('icons/de/ra11b.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**********************************/
  /* DE minor light signals type Sh */
  /**********************************/
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="light"] {
    /* cannot show Sh 1 or is a dwarf signal */
    marker-file: url('icons/de/sh0-light-dwarf.svg');
    marker-width: 12;
    marker-height: 8;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* normal height or no height tagged, can show sh1 or no states are tagged */
    ["minor_height"="normal"]["minor_states"=~"^(.*;)?DE-ESO:sh1(;.*)?$"],
    ["minor_height"="normal"]["minor_states"=null],
    ["minor_height"=null]["minor_states"=~"^(.*;)?DE-ESO:sh1(;.*)?$"],
    ["minor_height"=null]["minor_states"=null] {
      marker-file: url('icons/de/sh1-light-normal.svg');
      marker-width: 12;
      marker-height: 9;
      marker-allow-overlap: true;
    }
  }

  /**************************************/
  /* DE minor semaphore signals type Sh */
  /**************************************/
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="semaphore"]["minor_height"="normal"],
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="semaphore"][!"minor_height"] {
    marker-file: url('icons/de/sh1-semaphore-normal.svg');
    marker-width: 10;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /********************************************/
  /* DE minor semaphore dwarf signals type Sh */
  /* DE Sh 0 at buffer stops                  */
  /********************************************/
  [zoom>=17]["feature"="DE-ESO:sh"]["minor_form"="semaphore"]["minor_height"="dwarf"],
  [zoom>=17]["feature"="DE-ESO:sh0"]["minor_form"="sign"] {
    marker-file: url('icons/de/sh0-semaphore-dwarf.svg');
    marker-width: 12;
    marker-height: 11;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /************************************************/
  /* DE signal Sh 2 as signal and at buffer stops */
  /************************************************/
  [zoom>=17]["feature"="DE-ESO:sh2"],
  [zoom>=17]["feature"="DE-BOStrab:sh2"] {
    marker-file: url('icons/de/sh2.svg');
    marker-width: 16;
    marker-height: 13;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* FI shunting light signals type Ro (new) */
  /*******************************************/
  [zoom>=17]["feature"="FI:Ro"]["shunting_states"=~"FI:Ro0"]["shunting_form"="light"] {
    marker-file: url('icons/fi/ro0-new.svg');
    marker-width: 11;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /******************************************************/
  /* FI minor light signals type Lo at moveable bridges */
  /******************************************************/
  [zoom>=17]["feature"="FI:Lo"]["minor_states"=~"FI:Lo0"]["minor_form"="light"] {
    text-size: 10;
    marker-file: url('icons/fi/lo0.svg');
    marker-width: 7;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
    }
  }

  /***********************************************/
  /* AT shunting light signals (Verschubverbot)  */
  /***********************************************/
  [zoom>=17]["feature"="AT-V2:verschubsignal"]["shunting_form"="light"] {
    marker-file: url('icons/at/verschubverbot-aufgehoben.svg');
    marker-width: 10;
    marker-height: 14;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /*************************************************/
  /* AT minor light signals (Sperrsignale) as sign */
  /*************************************************/
  [zoom>=17]["feature"="AT-V2:weiterfahrt_verboten"]["minor_form"="sign"] {
    marker-file: url('icons/at/weiterfahrt-verboten.svg');
    marker-width: 12;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /**************************************************************/
  /* AT minor light signals (Sperrsignale) as semaphore signals */
  /**************************************************************/
  [zoom>=17]["feature"="AT-V2:sperrsignal"]["minor_form"="semaphore"] {
    marker-file: url('icons/at/weiterfahrt-erlaubt.svg');
    marker-width: 7;
    marker-height: 14;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 11;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /***************************/
  /* DE main entry sign Ne 1 */
  /* AT Trapeztafel          */
  /***************************/
  [zoom>=14]["feature"="DE-ESO:ne1"]["main_form"="sign"],
  [zoom>=14]["feature"="AT-V2:trapeztafel"]["main_form"="sign"] {
    marker-file: url('icons/de/ne1.svg');
    marker-width: 16;
    marker-height: 10;
    marker-allow-overlap: true;
  }

  /*****************************/
  /* DE distant signal type Ks */
  /*****************************/
  [zoom>=14]["feature"="DE-ESO:ks"]["distant_form"="light"] {
    marker-file: url('icons/de/ks-distant.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* repeaters */
    ["distant_repeated"="yes"] {
      marker-file: url('icons/de/ks-distant-repeated.svg');
      marker-width: 10;
      marker-height: 16;
      marker-allow-overlap: true;
    }

    /* shortened breaking distance */
    ["distant_shortened"="yes"] {
      marker-file: url('icons/de/ks-distant-shortened.svg');
      marker-width: 10;
      marker-height: 16;
      marker-allow-overlap: true;
    }
  }

  /********************************************************************************/
  /* DE distant light signals type Vr which                                       */
  /*  - are repeaters or shortened                                                */
  /*  - have no railway:signal:states=* tag                                       */
  /*  - OR have railway:signal:states=* tag that does neither include Vr1 nor Vr2 */
  /********************************************************************************/
  [zoom>=14]["feature"="DE-ESO:vr"]["distant_form"="light"] {
    marker-file: url('icons/de/vr0-light.svg');
    marker-width: 16;
    marker-height: 16;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

  /*  can display Vr 1 */
  ["distant_states"=~"^(.*;)?DE-ESO:vr1(;.*)?$"] {
    marker-file: url('icons/de/vr1-light.svg');
  }

  /*  can display Vr 2 */
  ["distant_states"=~"^(.*;)?DE-ESO:vr2(;.*)?$"] {
    marker-file: url('icons/de/vr2-light.svg');
  }

    ["distant_repeated"="yes"],
    ["distant_shortened"="yes"] {
      marker-file: url('icons/de/vr0-light-repeated.svg');

      /* can display Vr 1 */
      /* Signals which can Vr 2 as well will match the next rule as well which will overwrite this rule. */
      ["railway_signal:distant:states"=~"DE-ESO:vr1"] {
        marker-file: url('icons/de/vr1-light-repeated.svg');
      }

      /* can display Vr 2 */
      ["distant_states"=~"DE-ESO:vr2"] {
        marker-file: url('icons/de/vr2-light-repeated.svg');
      }
    }
  }


  /********************************************************************************/
  /* DE distant semaphore signals type Vr which                                   */
  /*  - have no railway:signal:states=* tag                                       */
  /*  - OR have railway:signal:states=* tag that does neither include Vr1 nor Vr2 */
  /********************************************************************************/
  [zoom>=14]["feature"="DE-ESO:vr"]["distant_form"="semaphore"] {
    marker-file: url('icons/de/vr0-semaphore.svg');
    marker-width: 12;
    marker-height: 26;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* can display Vr 1 */
    /* This rule is overwritten if the signal can show Vr 2 as well. */
    ["railway_signal:distant:states"=~"DE-ESO:vr1"] {
      marker-file: url('icons/de/vr1-semaphore.svg');
      marker-width: 12;
      marker-height: 19;
      marker-allow-overlap: true;
    }

    /* can display Vr 2 */
    ["distant_states"=~"DE-ESO:vr2"] {
      marker-file: url('icons/de/vr2-semaphore.svg');
      marker-width: 12;
      marker-height: 26;
      marker-allow-overlap: true;
    }
  }

  /****************************************/
  /* DE Hamburger Hochbahn distant signal */
  /****************************************/
  [zoom>=14]["feature"="DE-HHA:v"]["distant_form"="light"] {
    marker-file: url('icons/de/hha/v1.svg');
    marker-width: 5;
    marker-height: 16;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /************************************/
  /* DE distant light signals type Hl */
  /************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["distant_form"="light"] {
    marker-file: url('icons/de/hl1-distant.svg');
    marker-width: 8;
    marker-height: 12;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /***************************************/
  /* DE block marker ("Blockkennzeichen) */
  /***************************************/
  ["feature"="DE-ESO:blockkennzeichen"] {
    shield-file: url('icons/de/blockkennzeichen.svg');
    shield-width: 14;
    shield-height: 14;
    shield-allow-overlap: true;

    [zoom>=16] {
      shield-file: url('icons/de/blockkennzeichen.svg');
      shield-width: 20;
      shield-height: 20;
      shield-name: [ref];
      shield-fill: black;
      shield-face-name: @bold-fonts;
      shield-size: 10;
    }
  }

  /***********************/
  /* DE ETCS stop marker */
  /***********************/
  [zoom>=14]["feature"="DE-ESO:ne14"]["train_protection_form"="sign"]["train_protection_type"="block_marker"] {
    marker-file: url('icons/etcs-stop-marker-arrow-left.svg');
    marker-width: 16;
    marker-height: 16;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }


  /****************************/
  /* AT distant light signals */
  /****************************/
  [zoom>=14]["feature"="AT-V2:vorsignal"]["distant_form"="light"] {
    marker-file: url('icons/at/vorsignal-vorsicht.svg');
    marker-width: 11;
    marker-height: 11;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }

    /* can show proceed with full speed                                  */
    /* if the signal can also show other aspects, later rules will match */
    ["railway_signal:distant:states"=~"AT-V2:hauptsignal_frei"] {
      marker-file: url('icons/at/vorsignal-hauptsignal-frei.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }

    /* can show proceed with 40 kph speed (on narrow gauge lines 20 kph) */
    ["railway_signal:distant:states"=~"AT-V2:hauptsignal_frei_mit_40"],
    ["railway_signal:distant:states"=~"AT-V2:hauptsignal_frei_mit_20"] {
      marker-file: url('icons/at/vorsignal-hauptsignal-frei-mit-40.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }

    /* can show proceed with 60 kph speed                                */
    ["railway_signal:distant:states"=~"AT-V2:hauptsignal_frei_mit_60"] {
      marker-file: url('icons/at/vorsignal-hauptsignal-frei-mit-60.svg');
      marker-width: 11;
      marker-height: 11;
      marker-allow-overlap: true;
    }
  }

  /********************************/
  /* AT distant semaphore signals */
  /********************************/
  [zoom>=14]["feature"="AT-V2:vorsignal"]["distant_form"="semaphore"] {
    marker-file: url('icons/at/vorsicht-semaphore.svg');
    marker-width: 12;
    marker-height: 19;
    marker-allow-overlap: true;

    ::text {
      text-name: [ref];
      text-dy: 12;
      text-fill: @signal-text-fill;
      text-halo-radius: @signal-text-halo-radius;
      text-halo-fill: @signal-text-halo-fill;
      text-face-name: @bold-fonts;
      text-size: 10;
    }
  }

  /****************************/
  /* FI distant light signals */
  /****************************/
  [zoom>=14]["feature"="FI:Eo"]["distant_form"="light"],
  [zoom>=14]["feature"="FI:Eo-v"]["distant_form"="light"] {
    ["distant_repeated"="no"],
    ["distant_repeated"=null] {
      ::text {
        text-name: [ref];
        text-dy: 12;
        text-fill: @signal-text-fill;
        text-halo-radius: @signal-text-halo-radius;
        text-halo-fill: @signal-text-halo-fill;
        text-face-name: @bold-fonts;
        text-size: 10;
      }

      ["feature"="FI:Eo"] {
        marker-width: 9;
        marker-height: 15;
        marker-file: url('icons/fi/eo0-new.svg');
      }

      ["feature"="FI:Eo-v"] {
        marker-width: 10;
        marker-height: 10;
        marker-file: url('icons/fi/eo0-old.svg');
      }

      /* can display Eo 1 (expect proceed) */
      /* new type */
      ["railway_signal:distant:states"=~"FI:Eo1"] {
        marker-file: url('icons/fi/eo1-new.svg');
      }
      /* old type */
      ["railway_signal:distant:states"=~"FI:Eo1"] {
        marker-file: url('icons/fi/eo1-old.svg');
      }

      /* can display Eo 2 (expect proceed) -- new type */
      ["railway_signal:distant:states"=~"FI:Eo2"] {
        marker-file: url('icons/fi/eo2-new.svg');
      }
    }
  }

  /************************************************/
  /* DE distant signal replacement by sign So 106 */
  /* AT Kreuztafel                                */
  /************************************************/
  [zoom>=14]["feature"="DE-ESO:so106"]["distant_form"="sign"],
  [zoom>=14]["feature"="AT-V2:kreuztafel"]["distant_form"="sign"] {
    marker-file: url('icons/de/so106.svg');
    marker-width: 16;
    marker-height: 11;
    marker-allow-overlap: true;
  }

  /**********************************************/
  /* DE distant signal replacement by sign Ne 2 */
  /**********************************************/
  [zoom>=14]["feature"="DE-ESO:db:ne2"]["distant_form"="sign"] {
    marker-file: url('icons/de/ne2.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;

    /* reduced distance */
    ["distant_shortened"="yes"] {
      marker-file: url('icons/de/ne2-reduced-distance.svg');
      marker-width: 7;
      marker-height: 18;
    }
  }

  /*******************************************/
  /* DE main semaphore signals type Hp which */
  /*  - have no railway:signal:states=* tag  */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="semaphore"]["main_states"!~/^(.*;)?DE-ESO:hp(1|2)(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp0-semaphore.svg');
    marker-width: 16;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* DE main semaphore signals type Hp which */
  /*  - cannot display Hp 2                  */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="semaphore"]["main_states"!~/^(.*;)?DE-ESO:hp2(;.*)?$/]["main_states"=~"DE-ESO:hp1"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp1-semaphore.svg');
    marker-width: 12;
    marker-height: 19;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* DE main semaphore signals type Hp which */
  /*  - can display Hp 2                     */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="semaphore"]["main_states"=~"DE-ESO:hp2"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp2-semaphore.svg');
    marker-width: 12;
    marker-height: 20;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* AT main semaphore signals type Hp which */
  /*  - have no railway:signal:states=* tag  */
  /*******************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp0-semaphore.svg');
    marker-width: 16;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* AT main semaphore signals type Hp which */
  /*  - can show "Frei"                      */
  /*******************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"]["main_states"=~"AT-V2:frei"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp1-semaphore.svg');
    marker-width: 12;
    marker-height: 19;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* AT main semaphore signals type Hp which */
  /*  - can show "Frei mit 40"/"Frei mit 20" */
  /*******************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"]["main_states"=~"AT-V2:frei_mit_40"],
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="semaphore"]["main_states"=~"AT-V2:frei_mit_20"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp2-semaphore.svg');
    marker-width: 12;
    marker-height: 20;
    marker-allow-overlap: true;
  }

  /******************************************/
  /* DE main light signals type Hp which    */
  /*  - have no railway:signal:states=* tag */
  /******************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="light"]["main_states"!~/^(.*;)?DE-ESO:hp(1|2)(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp0-light.svg');
    marker-width: 9;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /***************************************/
  /* DE main light signals type Hp which */
  /*  - cannot display Hp 2              */
  /***************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="light"]["main_states"!~/^(.*;)?DE-ESO:hp2(;.*)?$/]["main_states"=~"DE-ESO:hp1"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp1-light.svg');
    marker-width: 9;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /***************************************/
  /* DE main light signals type Hp which */
  /*  - can display Hp 2                 */
  /***************************************/
  [zoom>=14]["feature"="DE-ESO:hp"]["main_form"="light"]["main_states"=~"DE-ESO:hp2"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hp2-light.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /************************************************************************/
  /* AT main light signals                                                */
  /*  - can show stop or does not have railway:signal:main:states tag     */
  /*  - if the signal can also show other aspects, later rules will match */
  /************************************************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"]["main_states"=~"AT-V2:halt"],
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"][!"main_states"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/at/hauptsignal-halt.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*********************************************************************************************/
  /* AT main light signals                                                                     */
  /*  - can show proceed with full speed                                                       */
  /* If the signal can show "proceed with 60 or 40 kph" the next rule also matches and is used */
  /*********************************************************************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"]["main_states"=~"AT-V2:frei"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/at/hauptsignal-frei.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /***************************************************************************************/
  /* AT main light signals                                                               */
  /*  - can show proceed with 40 kph or 20 kph                                                    */
  /* If the signal can show "proceed with 60 kph" the next rule also matches and is used */
  /***************************************************************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"]["main_states"=~"AT-V2:frei_mit_40"],
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"]["main_states"=~"AT-V2:frei_mit_20"]
  /* On narrow gauge railway lines "frei mit 40" is called "frei mit 20" but has the same appearance. */
  {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/at/hauptsignal-frei-mit-40.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /**************************************/
  /* AT main light signals              */
  /*  - can show proceed with 60 kph    */
  /**************************************/
  [zoom>=14]["feature"="AT-V2:hauptsignal"]["main_form"="light"]["main_states"=~"AT-V2:frei_mit_60"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/at/hauptsignal-frei-mit-60.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* FI main and combined light signals      */
  /* - general rules applying to all signals */
  /*******************************************/
  [zoom>=14]["feature"="FI:Po"]["main_form"="light"] {
    marker-width: 9;
    marker-height: 15;
    set .fi_main_combined_signals;
  }
  [zoom>=14]["feature"="FI:Po-v"]["main_form"="light"] {
    marker-width: 7;
    marker-height: 16;
    set .fi_main_combined_signals;
  }
  [zoom>=14]["feature"="FI:So"]["combined_form"="light"] {
    marker-width: 12;
    marker-height: 15;
    set .fi_main_combined_signals;
  }


  /***********************************************/
  /* FI main light signals which                 */
  /*  - have no railway:signal:main:states=* tag */
  /***********************************************/
  /* new type */
  node["feature"="FI:Po"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po0-new.svg');
    set .fi_main_combined_signal_icon;
  }
  /* old type */
  node["feature"="FI:Po-v"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po0-old.svg');
    set .fi_main_combined_signal_icon;
  }

  /********************************/
  /* FI main light signals which  */
  /*  - can display Po1 (proceed) */
  /********************************/
  /* new type */
  node["feature"="FI:Po"]["main_states"=~"FI:Po1"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po1-new.svg');
    set .fi_main_combined_signal_icon;
  }
  /* old type */
  node["feature"="FI:Po-v"]["main_states"=~"FI:Po1"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po1-old.svg');
    set .fi_main_combined_signal_icon;
  }

  /*********************************************/
  /* FI main light signals which               */
  /*  - can display Po2 (proceed at low speed) */
  /*********************************************/
  /* new type */
  node["feature"="FI:Po"]["main_states"=~"FI:Po2"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po2-new.svg');
    set .fi_main_combined_signal_icon;
  }
  /* old type */
  node["feature"="FI:Po-v"]["main_states"=~"FI:Po2"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/po2-old.svg');
    set .fi_main_combined_signal_icon;
  }

  /************************************/
  /* FI combined block signal type So */
  /************************************/
  node["feature"="FI:So"]["combined_states"=~"FI:Po1"]["combined_states"=~"FI:Eo1"].fi_main_combined_signals
  {
    marker-file: url('icons/fi/eo1-po1-combined-block.svg');
    set .fi_main_combined_signal_icon;
  }

  /************************************************/
  /* FI main and combined light signals           */
  /* - more general rules applying to all signals */
  /************************************************/
  node.fi_main_combined_signal_icon
  {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-allow-overlap: true;
  }

  /**********************************************************************************/
  /* DE main light signals type Hl which                                            */
  /*  - have no railway:signal:main:states tag combination which has a special icon */
  /**********************************************************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["main_form"="light"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl0.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /****************************************/
  /* DE main light signals type Hl which  */
  /*  - cannot display Hl 2, Hl 3a, Hl 3b */
  /****************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["main_form"="light"]["main_states"]["main_states"!~/^(.*;)?DE-ESO:hl(2|3(a|b))(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl1.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /***************************************/
  /* DE main light signals type Hl which */
  /*  - cannot display Hl 3b and Hl 2    */
  /***************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["main_form"="light"]["main_states"!~/^(.*;)?DE-ESO:hl(2|3b)(;.*)?$/]["main_states"=~"DE-ESO:hl3a"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl3a.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /***************************************/
  /* DE main light signals type Hl which */
  /*  - can display Hl 3a, Hl 3b         */
  /*  - cannot display Hl 2              */
  /***************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["main_form"="light"]["main_states"!~/^(.*;)?DE-ESO:hl2(;.*)?$/]["main_states"=~"DE-ESO:hl3b"]["main_states"=~"DE-ESO:hl3a"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl3b.svg');
    marker-width: 8;
    marker-height: 24;
    marker-allow-overlap: true;
  }

  /*********************************************/
  /* DE main light signals type Hl which       */
  /*  - can display Hl 2, Hl 3a                */
  /*  - don't have to be able to display Hl 3b */
  /*********************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["main_form"="light"]["main_states"=~"DE-ESO:hl3a"]["main_states"=~"DE-ESO:hl2"]["main_states"!~/^(.*;)?DE-ESO:hl3b(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl2.svg');
    marker-width: 8;
    marker-height: 24;
    marker-allow-overlap: true;
  }

  /**************************************************************************************/
  /* DE combined light signals type Hl which                                            */
  /*  - have no railway:signal:combined:states tag combination which has a special icon */
  /**************************************************************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["combined_form"="light"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl0.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* DE combined light signals type Hl which */
  /*  - cannot display Hl 11, Hl 12a, Hl 12b */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["combined_form"="light"]["combined_states"]["combined_states"!~/^(.*;)?DE-ESO:hl1(1|2(a|b))(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl10.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* DE combined light signals type Hl which */
  /*  - cannot display Hl 12b and Hl 11      */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["combined_form"="light"]["combined_states"]["combined_states"!~/^(.*;)?DE-ESO:hl1(1|2b)(;.*)?$/]["combined_states"=~"DE-ESO:hl12a"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl12a.svg');
    marker-width: 7;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*******************************************/
  /* DE combined light signals type Hl which */
  /*  - can display Hl 12a, Hl 12b           */
  /*  - cannot display Hl 11                 */
  /*******************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["combined_form"="light"]["combined_states"]["combined_states"!~/^(.*;)?DE-ESO:hl11(;.*)?$/]["combined_states"=~"DE-ESO:hl12b"]["combined_states"=~"DE-ESO:hl12a"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl12b.svg');
    marker-width: 8;
    marker-height: 24;
    marker-allow-overlap: true;
  }

  /**********************************************/
  /* DE combined light signals type Hl which    */
  /*  - can display Hl 11, Hl 12a               */
  /*  - don't have to be able to display Hl 12b */
  /**********************************************/
  [zoom>=14]["feature"="DE-ESO:hl"]["combined_form"="light"]["combined_states"]["combined_states"=~"DE-ESO:hl12a"]["combined_states"=~"DE-ESO:hl11"]["combined_states"!~/^(.*;)?DE-ESO:hl12b(;.*)?$/] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hl11.svg');
    marker-width: 8;
    marker-height: 24;
    marker-allow-overlap: true;
  }

  /*************************************/
  /* DE combined light signals type Sv */
  /* - which cannot show Hp 0          */
  /* - which can show Sv 0             */
  /*************************************/
  [zoom>=14]["feature"="DE-ESO:sv"]["combined_states"!~/^(.*;)?DE-ESO:hp0(;.*)?$/]["combined_states"=~"DE-ESO:sv0"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/sv-sv0.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /************************************/
  /* DE tram main signal "Fahrsignal" */
  /* general rules                    */
  /************************************/
  [zoom>=15]["feature"="DE-BOStrab:f$/"]["main_form"="light"],
  [zoom>=15]["feature"="DE-AVG:f$/"]["main_form"="light"] {
    text-name: [ref];
    text-dy: 16;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-width: 10;
    marker-height: 20;
    marker-allow-overlap: true;
    marker-file: url('icons/de/bostrab/f0.svg');
  }

  /************************************/
  /* DE tram main signal "Fahrsignal" */
  /* can show F 1 (proceed straight)  */
  /************************************/
  [zoom>=15]["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"DE-BOStrab:f1"],
  [zoom>=15]["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"DE-AVG:f1"] {
    marker-file: url('icons/de/bostrab/f1.svg');
  }

  /************************************/
  /* DE tram main signal "Fahrsignal" */
  /* can show F 2 (proceed right)     */
  /************************************/
  [zoom>=15]["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"DE-BOStrab:f2"],
  [zoom>=15]["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"DE-AVG:f2"] {
    marker-file: url('icons/de/bostrab/f2.svg');
  }

  /************************************/
  /* DE tram main signal "Fahrsignal" */
  /* can show F 3 (proceed left)      */
  /************************************/
  [zoom>=15]["feature"="DE-BOStrab:f"]["main_form"="light"]["main_states"=~"DE-BOStrab:f3"],
  [zoom>=15]["feature"="DE-AVG:f"]["main_form"="light"]["main_states"=~"DE-AVG:f3"] {
    marker-file: url('icons/de/bostrab/f3.svg');
  }

  /****************************************/
  /* DE Hamburger Hochbahn main signal    */
  /* without railway:signal:main:states=* */
  /****************************************/
  [zoom>=14]["feature"="DE-HHA:h"]["main_form"="light"][!"main_states"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hha/h0.svg');
    marker-width: 6;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*************************************/
  /* DE Hamburger Hochbahn main signal */
  /* with railway:signal:main:states=* */
  /*************************************/
  [zoom>=14]["feature"="DE-HHA:h"]["main_form"="light"]["main_states"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/hha/h1.svg');
    marker-width: 6;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /*************************************/
  /* DE combined light signals type Sv */
  /* - which can show Hp 0             */
  /*************************************/
  [zoom>=14]["feature"="DE-ESO:sv"]["combined_states"=~"DE-ESO:hp0"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/sv-hp0.svg');
    marker-width: 8;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /**************************/
  /* DE main signal type Ks */
  /**************************/
  [zoom>=14]["feature"="DE-ESO:ks"]["main_form"="light"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/ks-main.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /******************************/
  /* DE combined signal type Ks */
  /******************************/
  [zoom>=14]["feature"="DE-ESO:ks"]["combined_form"="light"]["combined_shortened"="no"],
  [zoom>=14]["feature"="DE-ESO:ks"]["combined_form"="light"][!"combined_shortened"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/ks-combined.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;
  }

  /****************************************/
  /* DE shortened combined signal type Ks */
  /****************************************/
  [zoom>=14]["feature"="DE-ESO:ks"]["combined_form"="light"]["combined_shortened"="yes"] {
    text-name: [ref];
    text-dy: 12;
    text-fill: @signal-text-fill;
    text-halo-radius: @signal-text-halo-radius;
    text-halo-fill: @signal-text-halo-fill;
    text-face-name: @bold-fonts;
    text-size: 10;
    marker-file: url('icons/de/ks-combined-shortened.svg');
    marker-width: 10;
    marker-height: 16;
    marker-allow-overlap: true;
  }
}