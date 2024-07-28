import React from "react";
import { render, screen } from "@testing-library/react";
import { act } from "react";
import App from "./App";

test("renders hello world", async () => {
  await act(async () => {
    render(<App />);
  });
  const linkElement = screen.getByText(/Hello World!/i);
  expect(linkElement).toBeInTheDocument();
});
