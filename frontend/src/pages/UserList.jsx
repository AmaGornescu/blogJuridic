import React, { useEffect, useState } from "react";
import axios from "axios";
import configData from "../config.json";
import { BiEdit } from "react-icons/bi";
import { AiOutlineDelete } from "react-icons/ai";
import { Button, Modal } from "react-bootstrap";
import { ToastContainer, toast } from "react-toastify";

import "react-toastify/dist/ReactToastify.css";

export default function UserList() {
  const [userList, setUserList] = useState([]);
  const [showModal, setShowModal] = useState(false);
  const [modalAction, setModalAction] = useState("");
  const [activeUser, setActiveUser] = useState({});
  const [message, setMessage] = useState("");

  const notify = () => toast("Wow so easy!");

  const token = JSON.parse(localStorage.getItem("user"));
  useEffect(() => {
    axios
      .get(configData.SERVER_URL, {
        headers: {
          Authorization: `token ${token.accessToken}`,
        },
      })
      .then(({ data }) => {
        setUserList(data["data"]);
      })
      .catch((error) => {
        console.log(error);
      });
  }, [token.accessToken]);

  const handleModalOpen = (type, user) => {
    type === "edit" ? setModalAction("edit") : setModalAction("delete");
    setShowModal(true);
    setActiveUser(user);
  };

  const handleNext = async ({ id }) => {
    try {
      await axios.delete(`${configData.SERVER_MAIN_URL}users/${id}`, {
        headers: {
          Authorization: `token ${token.accessToken}`,
        },
      });
      setShowModal(false);
      setMessage("Utilizatorul a fost sters cu succes!");
      const newUserList = userList.filter((user) => user.id !== id);
      setUserList(newUserList);
    } catch (err) {
      setMessage("Utilizatorul nu a fost sters cu succes!");
      notify(message);
    }
  };

  return (
    <div style={{ minHeight: "100vh" }}>
      {userList.length === 0 ? (
        <h3 className="text-center text-danger my-5">Nu exista utilizatori!</h3>
      ) : (
        <h1 className="text-center my-5 title-heading"> Vezi utilizatori</h1>
      )}
      <div className="accordion container my-5" id="accordionExample">
        {userList.map((user, index) => {
          return (
            <div className="accordion-item" key={user.id}>
              <h2 className="accordion-header" id={user.id}>
                <button
                  className="accordion-button"
                  type="button"
                  data-bs-toggle="collapse"
                  data-bs-target={user.id}
                  aria-expanded="true"
                  aria-controls={user.id}
                >
                  {index + 1}. {user.prenume} {user.nume}
                </button>
              </h2>
              <div
                id={user.id}
                className="accordion-collapse collapse show"
                aria-labelledby={user.id}
                data-bs-parent="#accordionExample"
              >
                <div className="accordion-body">{user.email}</div>
                <Button
                  variant="danger"
                  size="lg"
                  className=" btn btn-primary rounded submit p-3 px-5 my-3"
                  block="block"
                  type="button"
                  onClick={() => handleModalOpen("edit")}
                >
                  <BiEdit color="white" /> Editeaza
                </Button>
                <Button
                  variant="danger"
                  size="lg"
                  className=" btn btn-danger rounded submit p-3 px-5 my-3 mx-3"
                  block="block"
                  type="button"
                  onClick={() => handleModalOpen("delete", user)}
                >
                  <AiOutlineDelete color="white" /> Sterge
                </Button>
              </div>
              <ToastContainer />
              <div
                className="modal show"
                style={{ display: "block", position: "initial" }}
              >
                <Modal
                  show={showModal}
                  onHide={() => setShowModal(false)}
                  backdrop="static"
                  keyboard={false}
                >
                  <Modal.Header closeButton>
                    <Modal.Title>
                      {modalAction === "edit" ? <>Editare</> : <>Stergere</>}
                    </Modal.Title>
                  </Modal.Header>

                  <Modal.Body>
                    {modalAction === "edit" ? (
                      <p>Editare</p>
                    ) : (
                      <p>
                        Sunteti sigur ca doriti sa stergeti utilizatorul cu
                        numele {activeUser.prenume} {activeUser.nume}?
                      </p>
                    )}
                  </Modal.Body>

                  <Modal.Footer>
                    <Button
                      variant="secondary"
                      onClick={() => setShowModal(false)}
                    >
                      Renunta
                    </Button>
                    <Button
                      variant="primary"
                      onClick={() => handleNext(activeUser)}
                    >
                      Continua
                    </Button>
                  </Modal.Footer>
                </Modal>
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
