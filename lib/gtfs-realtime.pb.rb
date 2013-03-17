#!/usr/bin/env ruby
# Generated by the protocol buffer compiler. DO NOT EDIT!

require 'protocol_buffers'

module TransitRealtime
  # forward declarations
  class FeedMessage < ::ProtocolBuffers::Message; end
  class FeedHeader < ::ProtocolBuffers::Message; end
  class FeedEntity < ::ProtocolBuffers::Message; end
  class TripUpdate < ::ProtocolBuffers::Message; end
  class VehiclePosition < ::ProtocolBuffers::Message; end
  class Alert < ::ProtocolBuffers::Message; end
  class TimeRange < ::ProtocolBuffers::Message; end
  class Position < ::ProtocolBuffers::Message; end
  class TripDescriptor < ::ProtocolBuffers::Message; end
  class VehicleDescriptor < ::ProtocolBuffers::Message; end
  class EntitySelector < ::ProtocolBuffers::Message; end
  class TranslatedString < ::ProtocolBuffers::Message; end

  class FeedMessage < ::ProtocolBuffers::Message
    required ::TransitRealtime::FeedHeader, :header, 1
    repeated ::TransitRealtime::FeedEntity, :entity, 2
  end

  class FeedHeader < ::ProtocolBuffers::Message
    # forward declarations

    # enums
    module Incrementality
      include ::ProtocolBuffers::Enum
      FULL_DATASET = 0
      DIFFERENTIAL = 1
    end

    required :string, :gtfs_realtime_version, 1
    optional ::TransitRealtime::FeedHeader::Incrementality, :incrementality, 2, :default => ::TransitRealtime::FeedHeader::Incrementality::FULL_DATASET
    optional :uint64, :timestamp, 3
  end

  class FeedEntity < ::ProtocolBuffers::Message
    required :string, :id, 1
    optional :bool, :is_deleted, 2, :default => false
    optional ::TransitRealtime::TripUpdate, :trip_update, 3
    optional ::TransitRealtime::VehiclePosition, :vehicle, 4
    optional ::TransitRealtime::Alert, :alert, 5
  end

  class TripUpdate < ::ProtocolBuffers::Message
    # forward declarations
    class StopTimeEvent < ::ProtocolBuffers::Message; end
    class StopTimeUpdate < ::ProtocolBuffers::Message; end

    # nested messages
    class StopTimeEvent < ::ProtocolBuffers::Message
      optional :int32, :delay, 1
      optional :int64, :time, 2
      optional :int32, :uncertainty, 3
    end

    class StopTimeUpdate < ::ProtocolBuffers::Message
      # forward declarations

      # enums
      module ScheduleRelationship
        include ::ProtocolBuffers::Enum
        SCHEDULED = 0
        SKIPPED = 1
        NO_DATA = 2
      end

      optional :uint32, :stop_sequence, 1
      optional :string, :stop_id, 4
      optional ::TransitRealtime::TripUpdate::StopTimeEvent, :arrival, 2
      optional ::TransitRealtime::TripUpdate::StopTimeEvent, :departure, 3
      optional ::TransitRealtime::TripUpdate::StopTimeUpdate::ScheduleRelationship, :schedule_relationship, 5, :default => ::TransitRealtime::TripUpdate::StopTimeUpdate::ScheduleRelationship::SCHEDULED
    end

    required ::TransitRealtime::TripDescriptor, :trip, 1
    optional ::TransitRealtime::VehicleDescriptor, :vehicle, 3
    repeated ::TransitRealtime::TripUpdate::StopTimeUpdate, :stop_time_update, 2
    optional :uint64, :timestamp, 4
  end

  class VehiclePosition < ::ProtocolBuffers::Message
    # forward declarations

    # enums
    module VehicleStopStatus
      include ::ProtocolBuffers::Enum
      INCOMING_AT = 0
      STOPPED_AT = 1
      IN_TRANSIT_TO = 2
    end

    module CongestionLevel
      include ::ProtocolBuffers::Enum
      UNKNOWN_CONGESTION_LEVEL = 0
      RUNNING_SMOOTHLY = 1
      STOP_AND_GO = 2
      CONGESTION = 3
      SEVERE_CONGESTION = 4
    end

    optional ::TransitRealtime::TripDescriptor, :trip, 1
    optional ::TransitRealtime::VehicleDescriptor, :vehicle, 8
    optional ::TransitRealtime::Position, :position, 2
    optional :uint32, :current_stop_sequence, 3
    optional :string, :stop_id, 7
    optional ::TransitRealtime::VehiclePosition::VehicleStopStatus, :current_status, 4, :default => ::TransitRealtime::VehiclePosition::VehicleStopStatus::IN_TRANSIT_TO
    optional :uint64, :timestamp, 5
    optional ::TransitRealtime::VehiclePosition::CongestionLevel, :congestion_level, 6
  end

  class Alert < ::ProtocolBuffers::Message
    # forward declarations

    # enums
    module Cause
      include ::ProtocolBuffers::Enum
      UNKNOWN_CAUSE = 1
      OTHER_CAUSE = 2
      TECHNICAL_PROBLEM = 3
      STRIKE = 4
      DEMONSTRATION = 5
      ACCIDENT = 6
      HOLIDAY = 7
      WEATHER = 8
      MAINTENANCE = 9
      CONSTRUCTION = 10
      POLICE_ACTIVITY = 11
      MEDICAL_EMERGENCY = 12
    end

    module Effect
      include ::ProtocolBuffers::Enum
      NO_SERVICE = 1
      REDUCED_SERVICE = 2
      SIGNIFICANT_DELAYS = 3
      DETOUR = 4
      ADDITIONAL_SERVICE = 5
      MODIFIED_SERVICE = 6
      OTHER_EFFECT = 7
      UNKNOWN_EFFECT = 8
      STOP_MOVED = 9
    end

    repeated ::TransitRealtime::TimeRange, :active_period, 1
    repeated ::TransitRealtime::EntitySelector, :informed_entity, 5
    optional ::TransitRealtime::Alert::Cause, :cause, 6, :default => ::TransitRealtime::Alert::Cause::UNKNOWN_CAUSE
    optional ::TransitRealtime::Alert::Effect, :effect, 7, :default => ::TransitRealtime::Alert::Effect::UNKNOWN_EFFECT
    optional ::TransitRealtime::TranslatedString, :url, 8
    optional ::TransitRealtime::TranslatedString, :header_text, 10
    optional ::TransitRealtime::TranslatedString, :description_text, 11
  end

  class TimeRange < ::ProtocolBuffers::Message
    optional :uint64, :start, 1
    optional :uint64, :end, 2
  end

  class Position < ::ProtocolBuffers::Message
    required :float, :latitude, 1
    required :float, :longitude, 2
    optional :float, :bearing, 3
    optional :double, :odometer, 4
    optional :float, :speed, 5
  end

  class TripDescriptor < ::ProtocolBuffers::Message
    # forward declarations

    # enums
    module ScheduleRelationship
      include ::ProtocolBuffers::Enum
      SCHEDULED = 0
      ADDED = 1
      UNSCHEDULED = 2
      CANCELED = 3
      REPLACEMENT = 5
    end

    optional :string, :trip_id, 1
    optional :string, :route_id, 5
    optional :string, :start_time, 2
    optional :string, :start_date, 3
    optional ::TransitRealtime::TripDescriptor::ScheduleRelationship, :schedule_relationship, 4
  end

  class VehicleDescriptor < ::ProtocolBuffers::Message
    optional :string, :id, 1
    optional :string, :label, 2
    optional :string, :license_plate, 3
  end

  class EntitySelector < ::ProtocolBuffers::Message
    optional :string, :agency_id, 1
    optional :string, :route_id, 2
    optional :int32, :route_type, 3
    optional ::TransitRealtime::TripDescriptor, :trip, 4
    optional :string, :stop_id, 5
  end

  class TranslatedString < ::ProtocolBuffers::Message
    # forward declarations
    class Translation < ::ProtocolBuffers::Message; end

    # nested messages
    class Translation < ::ProtocolBuffers::Message
      required :string, :text, 1
      optional :string, :language, 2
    end

    repeated ::TransitRealtime::TranslatedString::Translation, :translation, 1
  end

end
