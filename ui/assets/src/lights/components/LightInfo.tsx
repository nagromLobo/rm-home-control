import React from "react";
import { Light } from "../types";
import styles from "./LightInfo.module.less";

type LightInfoProps = {
  light: Light;
};

const LightInfo = ({ light }: LightInfoProps) => {
  return <div className={`${light.is_on ? styles.on : ""}`}>{light.id}</div>;
};

export default LightInfo;
