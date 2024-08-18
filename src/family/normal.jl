function NormalEPCA(
    indim::Integer,
    outdim::Integer;
    ϵ=eps()
)
    # NOTE: equivalent to generic PCA
    # assume χ = ℝ
    @. begin
        Bregman(p, q) = Distances.sqeuclidean(p, q) / 2
    end
    g = identity
    μ = g(1)
    epca = EPCA(
        indim,
        outdim,
        Bregman,
        g,
        Val((:Bregman, :g));
        μ=μ,
        ϵ=ϵ
    )
    return epca
end

# alias
function GaussianEPCA(
    indim::Integer,
    outdim::Integer;
    ϵ=eps()
)
    epca = NormalEPCA(
        indim,
        outim;
        ϵ=ϵ
    )
    return epca
end