export type LightType = {
  id: string;
  name: string;
  provider: string;
  is_on: boolean;
};

export type LightMutation = {
  is_on: boolean;
};
