# Metodologia de Reconhecimento Externo - HackTricks

## Objetivo

Identificar todas as empresas subsidiárias e seus ativos relacionados à empresa principal, seguindo um processo estruturado de reconhecimento externo.

## Fases da Metodologia

### 1. Identificação de Empresas Subsidiárias (Aquisições)

**Objetivo:** Descobrir todas as empresas adquiridas pela empresa principal.

**Ferramentas/Técnicas:**

- **Crunchbase**: Pesquisar a empresa principal e verificar a seção "Aquisições"
    
- **Wikipedia**: Consultar a página da empresa para encontrar informações sobre aquisições
    
- **Resultado esperado**: Lista de empresas subsidiárias dentro do escopo
    

### 2. Identificação de Ativos de Rede (ASNs)

**Objetivo:** Encontrar os intervalos de IP pertencentes a cada empresa.

**Ferramentas/Técnicas:**

- **BGP Toolkit (bgp.he.net)**: Pesquisar por nome da empresa, IP ou domínio
    
- **Registros Regionais**: AFRINIC, ARIN, APNIC, LACNIC, RIPE NCC
    
- **Ferramentas Automatizadas**:

```python
amass intel -org <empresa>
amass intel -asn <ASN1>,<ASN2>
bbot -t <dominio> -f subdomain-enum
```
- **Resultado esperado**: Lista de ASNs e intervalos de IP associados

### 3. Pesquisa Reversa de Ativos

**Objetivo:** Expandir a descoberta de ativos relacionados.

**Técnicas:**

- **Whois reverso**: Buscar por campos como organização, e-mail ou outros dados encontrados
    
- **Ferramentas**:
    
    - ViewDNS.info
        
    - DomainEye
        
    - Whoxy
        
    - DomLink (para automação)
        

### 4. Busca por Vulnerabilidades

**Objetivo:** Identificar vulnerabilidades nos ativos descobertos.

**Ações:**

- Executar scanners de vulnerabilidade (Nessus, OpenVAS)
    
- Realizar varreduras de portas (nmap, masscan)
    
- Usar Shodan para identificar serviços expostos
    
- Força bruta em serviços identificados (quando autorizado)
    

## Descoberta de Domínios

### 1. DNS Reverso

**Objetivo:** Encontrar domínios associados aos IPs identificados.

**Ferramentas:**

```python
dnsrecon -r <intervalo_IP> -n <DNS>
dnsrecon -d <dominio> -r <intervalo_IP>
```

### 2. Whois Reverso

**Objetivo:** Encontrar domínios relacionados através de dados de registro.

**Ferramentas:**

- ViewDNS.info
    
- DomainEye
    
- Whoxy
    
- DomLink (automação)
    

### 3. Técnicas Avançadas

**Métodos:**

- **Trackers**: Identificar domínios com mesmos IDs de analytics/ads
    
- **Favicon**: Buscar por hash de favicon semelhante
    
- **Strings únicas**: Procurar por textos de copyright específicos
    
- **DMARC**: Analisar registros DMARC para domínios relacionados
    

## Descoberta de Subdomínios

### 1. Enumeração Passiva

**Ferramentas:**

- BBOT
    
- Amass
    
- Subfinder
    
- Findomain
    
- Assetfinder
    

### 2. Força Bruta DNS

**Ferramentas:**

- MassDNS
    
- Gobuster DNS
    
- Shuffledns
    
- Puredns
    

### 3. Segunda Rodada de Força Bruta

**Técnicas:**

- Gerar permutações de subdomínios conhecidos
    
- Ferramentas:
    
    - dnsgen
        
    - goaltdns
        
    - gotator
        
    - altdns
        

### 4. VHosts Virtuais

**Métodos:**

- Identificar hosts virtuais em IPs compartilhados
    
- Ferramentas: HostHunter
    

## Identificação de IPs

**Processo:**

1. Consolidar IPs de intervalos identificados
    
2. Resolver DNS para domínios/subdomínios
    
3. Verificar histórico de IPs (SecurityTrails)
    
4. Usar hakip2host para mapeamento reverso
    

## Busca por Servidores Web

**Abordagem:**

- Identificar portas web (80, 443, 8080, etc.)
    
- Ferramentas:
    
    - httprobe
        
    - fprobe
        
    - httpx
        
- Capturar screenshots para análise visual:
    
    - EyeWitness
        
    - Aquatone
        
    - Gowitness
        

## Ativos em Nuvem Pública

**Estratégia:**

1. Gerar lista de palavras-chave relacionadas à empresa
    
2. Criar permutações para nomes de buckets/recursos
    
3. Ferramentas:
    
    - cloud_enum
        
    - CloudScraper
        
    - S3Scanner
        

## Coleta de E-mails

**Fontes:**

- theHarvester
    
- Hunter.io (API)
    
- Snov.io (API)
    
- Minelead (API)
    

## Vazamentos de Credenciais

**Fontes:**

- Leak-Lookup
    
- Dehashed
    

## Vazamentos de Segredos

**Áreas de Busca:**

1. **GitHub**:
    
    - Leakos + gitleaks
        
    - GitHub Dorks
        
2. **Pastas Públicas**:
    
    - Pastos (ferramenta)
        
3. **Google Dorks**:
    
    - Google Hacking Database
        
    - Gorks (automação)
        

## Ferramentas de Automação Completa

**Soluções Integradas:**

- Rengine
    
- Osmedeus
    
- reconftw
    
- EchoPwn
    

## Fluxo de Trabalho Recomendado

1. Identificar empresas subsidiárias
    
2. Mapear ASNs e intervalos IP
    
3. Descobrir domínios e subdomínios
    
4. Identificar servidores web e serviços
    
5. Buscar por credenciais vazadas
    
6. Verificar vazamentos em repositórios públicos
    
7. Documentar todos os ativos encontrados
    

## Considerações Finais

- Sempre respeitar o escopo e termos de engajamento
    
- Manter registro detalhado de todos os achados
    
- Priorizar vulnerabilidades de acordo com criticidade
    
- Documentar metodologia e ferramentas utilizadas
