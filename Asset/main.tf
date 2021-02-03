module "awschallenge_ingest" {
    source = ""
    config = local.config["core_infrastructure"]
    config_json_path= "congifs/awschallenge_ingest.json"
    stepfunction_arn= local.config["step_functions"]["step_funtion_name"]["stepfunction_arn"]
    providers ={
        aws      = aws
        external = external
        null     = null
        random   = random
        template = template

    }
}

module "awschallenge_source" {
    source = ""
    config = local.config["core_infrastructure"]
    config_json_path= "congifs/awschallenge_source.json"
    stepfunction_arn= local.config["step_functions"]["step_funtion_name"]["stepfunction_arn"]
    providers ={
        aws      = aws
        external = external
        null     = null
        random   = random
        template = template

    }
}

module "awschllenge_prepare" {
    source = ""
    module "awschallenge_source" {
    config = local.config["core_infrastructure"]
    config_json_path= "congifs/awschallenge_source.json"
    stepfunction_arn= local.config["step_functions"]["step_funtion_name"]["stepfunction_arn"]
    providers ={
        aws      = aws
        external = external
        null     = null
        random   = random
        template = template

    }
    }
}