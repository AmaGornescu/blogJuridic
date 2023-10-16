import React from "react";
import GoogleMapReact from "google-map-react";

const AnyReactComponent = ({ text }) => <div>{text}</div>;

const POSITION = {
  center: {
    lat: 44.439663,
    lng: 26.096306,
  },
  zoom: 11,
};

const Contact = () => {
  return (
    <div className="container p-5">
      <h1 className="text-center my-5">Contact</h1>
      <div className="d-flex justify-content-between">
        <div className="d-flex flex-column justify-content-around border shadow-lg rounded p-3">
          <h5>
            <span className="fw-bold">Adresa:</span> Strada Progresului, nr. 20,
            Bucuresti, sector 5
          </h5>
          <h5>
            <span className="fw-bold">Numar de telefon:</span> 0756787927
          </h5>
          <h5>
            <span className="fw-bold">
              Contact general JurnalulJuridic.ro:{" "}
            </span>{" "}
            contact@jurnaluljuridic.ro
          </h5>
          <h5>
            <span className="fw-bold">
              Chestiuni administrative și probleme tehnice:
            </span>{" "}
            admin@jurnaluljuridic.ro
          </h5>
          <h5>
            <span className="fw-bold">
              Protecția datelor cu caracter personal:
            </span>{" "}
            privacy@jurnalul.juridic.ro
          </h5>
        </div>
        <div style={{ height: "60vh", width: "50%" }}>
          <GoogleMapReact
            bootstrapURLKeys={{ key: "" }}
            defaultCenter={POSITION.center}
            defaultZoom={POSITION.zoom}
          >
            <AnyReactComponent
              lat={59.955413}
              lng={30.337844}
              text="My Marker"
            />
          </GoogleMapReact>
        </div>
      </div>
    </div>
  );
};

export default Contact;
