// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Domain {
  String status;
  String fqdn;
  String publicationStatus;
  String expiresAt;
  Domain({
    required this.status,
    required this.fqdn,
    required this.publicationStatus,
    required this.expiresAt,
  });

  Domain copyWith({
    String? status,
    String? fqdn,
    String? publicationStatus,
    String? expiresAt,
  }) {
    return Domain(
      status: status ?? this.status,
      fqdn: fqdn ?? this.fqdn,
      publicationStatus: publicationStatus ?? this.publicationStatus,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'fqdn': fqdn,
      'publicationStatus': publicationStatus,
      'expiresAt': expiresAt,
    };
  }

  factory Domain.fromMap(Map<String, dynamic> map) {
    return Domain(
      status: map['status'],
      fqdn: map['fqdn'],
      publicationStatus: map['publicationStatus'],
      expiresAt: map['expiresAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Domain.fromJson(String source) => Domain.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Domain(status: $status, fqdn: $fqdn, publicationStatus: $publicationStatus, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(covariant Domain other) {
    if (identical(this, other)) return true;

    return other.status == status && other.fqdn == fqdn && other.publicationStatus == publicationStatus && other.expiresAt == expiresAt;
  }

  @override
  int get hashCode {
    return status.hashCode ^ fqdn.hashCode ^ publicationStatus.hashCode ^ expiresAt.hashCode;
  }
}
