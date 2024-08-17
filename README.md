# QABolts

## Overview

QABolts is a comprehensive solution for QA automation, providing end-to-end test automation services for both web and mobile (android + ios) and infrastructure for startups and companies. Our goal is to simplify the testing process, ensuring robust and efficient automation. The framework is designed to mimic end-user interactions with the application using text, images, or icons on the screen.

## Features

- **End-to-End Automation**: Covers the entire testing lifecycle.
- **Infrastructure Support**: Offers scalable infrastructure to run your tests.
- **User Interaction Simulation**: Mimics how end users interact with the application.
- **Record Speed Automation**: Enables writing automation tests at record speed.
- **Minimal Maintenance**: Requires minimal maintenance if something changes on the page, as it does not rely on xpaths or CSS to identify each element.
- **Targeted at Startups**: Ideal for startups that have raised funding.

## Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/QABolts/QAbolts.git
    ```
2. Navigate to the project directory:
    ```bash
    cd QAbolts
    ```
3. Install the dependencies:
    ```bash
    pip install -r requirements.txt
    ```

## Usage

This repository contains sample code for automating tests on the Orange HRM site.

1. Configure the `settings.resource` file with your project-specific settings.
2. Run the tests:
    ```bash
    robot tests/
    ```

## Contributing

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature/your-feature-name
    ```
3. Commit your changes:
    ```bash
    git commit -m 'Add some feature'
    ```
4. Push to the branch:
    ```bash
    git push origin feature/your-feature-name
    ```
5. Open a pull request.

## License

This project is licensed under the MIT License.

## Contact

For more information, visit our [website](https://qabolts.com) or contact us at info@qabolts.com.
