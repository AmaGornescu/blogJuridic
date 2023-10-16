import React from "react";
import Juridic from "../assets/juridic.jpg";

export default function Header() {
  return (
    // Page header with logo and tagline
    <header className="py-3 bg-light border-bottom">
      <div className="container">
        <div className="my-3 d-flex justify-content-around align-items-center">
          <div>
            <img src={Juridic} alt="juridic" />
          </div>
          <div>
            <h1 className="fw-bolder">Bine ati venit la Jurnalul Juridic!</h1>
            <p className="lead mb-0">
              Un jurnal despre noutatile in domeniul juridic si nu numai
            </p>
          </div>
        </div>
      </div>
    </header>
  );
}
